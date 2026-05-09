; DESCRIPTION: Renders a yellow line between points (397, 239) and (337, 126).
; PLAN: r0=397(x1), r1=239(y1), r2=337(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 239
LDI r2, 337
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
