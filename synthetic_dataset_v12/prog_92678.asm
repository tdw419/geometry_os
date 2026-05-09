; DESCRIPTION: Places a yellow 17x27 rectangle at position (285, 186).
; PLAN: r0=285(x), r1=186(y), r2=17(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 186
LDI r2, 17
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
