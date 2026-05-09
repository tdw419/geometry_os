; DESCRIPTION: Places a yellow 115x27 rectangle at position (382, 177).
; PLAN: r0=382(x), r1=177(y), r2=115(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 177
LDI r2, 115
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
