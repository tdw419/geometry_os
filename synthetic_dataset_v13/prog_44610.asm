; DESCRIPTION: Places a cyan line segment connecting (380, 231) to (116, 197).
; PLAN: r0=380(x1), r1=231(y1), r2=116(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 231
LDI r2, 116
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
