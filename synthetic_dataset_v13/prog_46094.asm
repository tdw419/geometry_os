; DESCRIPTION: Draws a black line from (328, 180) to (410, 213).
; PLAN: r0=328(x1), r1=180(y1), r2=410(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 180
LDI r2, 410
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
