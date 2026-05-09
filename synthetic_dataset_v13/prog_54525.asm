; DESCRIPTION: Places a cyan line segment connecting (206, 240) to (243, 37).
; PLAN: r0=206(x1), r1=240(y1), r2=243(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 240
LDI r2, 243
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
