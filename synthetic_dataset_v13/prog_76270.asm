; DESCRIPTION: Places a cyan line segment connecting (305, 253) to (352, 26).
; PLAN: r0=305(x1), r1=253(y1), r2=352(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 253
LDI r2, 352
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
