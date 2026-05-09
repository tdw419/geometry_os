; DESCRIPTION: Places a cyan line segment connecting (123, 253) to (187, 221).
; PLAN: r0=123(x1), r1=253(y1), r2=187(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 253
LDI r2, 187
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
