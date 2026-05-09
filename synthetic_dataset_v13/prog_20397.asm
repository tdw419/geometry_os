; DESCRIPTION: Renders a cyan box of size 72x82 starting at (46, 17).
; PLAN: r0=46(x), r1=17(y), r2=72(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 17
LDI r2, 72
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
