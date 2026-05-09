; DESCRIPTION: Renders a green line between points (434, 48) and (405, 113).
; PLAN: r0=434(x1), r1=48(y1), r2=405(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 48
LDI r2, 405
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
