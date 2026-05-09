; DESCRIPTION: Draws a green line from (368, 8) to (346, 170).
; PLAN: r0=368(x1), r1=8(y1), r2=346(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 8
LDI r2, 346
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
