; DESCRIPTION: Renders a cyan box of size 26x56 starting at (470, 145).
; PLAN: r0=470(x), r1=145(y), r2=26(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 145
LDI r2, 26
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
