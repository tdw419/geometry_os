; DESCRIPTION: Places a cyan line segment connecting (340, 206) to (453, 174).
; PLAN: r0=340(x1), r1=206(y1), r2=453(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 206
LDI r2, 453
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
