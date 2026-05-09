; DESCRIPTION: Draws a cyan line from (170, 67) to (191, 207).
; PLAN: r0=170(x1), r1=67(y1), r2=191(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 67
LDI r2, 191
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
