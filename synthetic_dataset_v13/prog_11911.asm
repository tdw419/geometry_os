; DESCRIPTION: Places a yellow 115x90 rectangle at position (262, 132).
; PLAN: r0=262(x), r1=132(y), r2=115(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 132
LDI r2, 115
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
