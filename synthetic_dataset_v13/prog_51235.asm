; DESCRIPTION: Draws a cyan line from (21, 130) to (243, 128).
; PLAN: r0=21(x1), r1=130(y1), r2=243(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 130
LDI r2, 243
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
