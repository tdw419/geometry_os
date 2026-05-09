; DESCRIPTION: Draws a cyan line from (213, 117) to (319, 172).
; PLAN: r0=213(x1), r1=117(y1), r2=319(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 117
LDI r2, 319
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
