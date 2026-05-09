; DESCRIPTION: Places a red 94x90 rectangle at position (259, 127).
; PLAN: r0=259(x), r1=127(y), r2=94(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 127
LDI r2, 94
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
