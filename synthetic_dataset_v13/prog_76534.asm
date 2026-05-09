; DESCRIPTION: Draws a green line from (502, 63) to (435, 192).
; PLAN: r0=502(x1), r1=63(y1), r2=435(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 63
LDI r2, 435
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
