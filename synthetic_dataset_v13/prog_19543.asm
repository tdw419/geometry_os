; DESCRIPTION: Places a red 47x27 rectangle at position (260, 168).
; PLAN: r0=260(x), r1=168(y), r2=47(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 168
LDI r2, 47
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
