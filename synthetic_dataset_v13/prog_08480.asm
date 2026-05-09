; DESCRIPTION: Renders a cyan box of size 47x105 starting at (46, 20).
; PLAN: r0=46(x), r1=20(y), r2=47(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 20
LDI r2, 47
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
