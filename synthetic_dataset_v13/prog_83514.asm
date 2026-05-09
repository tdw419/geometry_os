; DESCRIPTION: Draws a cyan line from (407, 130) to (28, 6).
; PLAN: r0=407(x1), r1=130(y1), r2=28(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 130
LDI r2, 28
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
