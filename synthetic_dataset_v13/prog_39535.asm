; DESCRIPTION: Places a purple circle of radius 42 at center (103, 202).
; PLAN: r0=103(x), r1=202(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 202
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
