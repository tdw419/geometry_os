; DESCRIPTION: Draws a green line from (237, 109) to (410, 57).
; PLAN: r0=237(x1), r1=109(y1), r2=410(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 109
LDI r2, 410
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
