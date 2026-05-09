; DESCRIPTION: Places a green 93x30 rectangle at position (112, 173).
; PLAN: r0=112(x), r1=173(y), r2=93(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 173
LDI r2, 93
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
