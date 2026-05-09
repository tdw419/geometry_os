; DESCRIPTION: Renders a green line between points (284, 111) and (447, 207).
; PLAN: r0=284(x1), r1=111(y1), r2=447(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 111
LDI r2, 447
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
