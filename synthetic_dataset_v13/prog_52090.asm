; DESCRIPTION: Places a cyan line segment connecting (401, 97) to (412, 221).
; PLAN: r0=401(x1), r1=97(y1), r2=412(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 97
LDI r2, 412
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
