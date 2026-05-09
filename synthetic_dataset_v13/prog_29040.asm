; DESCRIPTION: Places a green 65x48 rectangle at position (93, 57).
; PLAN: r0=93(x), r1=57(y), r2=65(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 57
LDI r2, 65
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
