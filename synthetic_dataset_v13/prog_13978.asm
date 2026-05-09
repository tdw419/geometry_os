; DESCRIPTION: Renders a purple line between points (284, 143) and (392, 173).
; PLAN: r0=284(x1), r1=143(y1), r2=392(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 143
LDI r2, 392
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
