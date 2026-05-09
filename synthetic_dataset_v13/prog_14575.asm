; DESCRIPTION: Places a cyan line segment connecting (72, 167) to (275, 253).
; PLAN: r0=72(x1), r1=167(y1), r2=275(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 167
LDI r2, 275
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
