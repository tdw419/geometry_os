; DESCRIPTION: Renders a cyan box of size 85x46 starting at (239, 37).
; PLAN: r0=239(x), r1=37(y), r2=85(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 37
LDI r2, 85
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
