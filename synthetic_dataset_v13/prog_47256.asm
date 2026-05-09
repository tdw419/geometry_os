; DESCRIPTION: Draws a cyan line from (384, 231) to (455, 92).
; PLAN: r0=384(x1), r1=231(y1), r2=455(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 231
LDI r2, 455
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
