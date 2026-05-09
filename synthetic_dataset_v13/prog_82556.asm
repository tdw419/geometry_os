; DESCRIPTION: Places a red 101x111 rectangle at position (142, 57).
; PLAN: r0=142(x), r1=57(y), r2=101(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 57
LDI r2, 101
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
