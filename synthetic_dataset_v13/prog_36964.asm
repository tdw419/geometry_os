; DESCRIPTION: Places a red circle of radius 27 at center (176, 202).
; PLAN: r0=176(x), r1=202(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 202
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
