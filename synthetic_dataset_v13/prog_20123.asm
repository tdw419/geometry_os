; DESCRIPTION: Draws a purple line from (346, 191) to (479, 86).
; PLAN: r0=346(x1), r1=191(y1), r2=479(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 191
LDI r2, 479
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
