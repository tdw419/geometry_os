; DESCRIPTION: Places a green 21x47 rectangle at position (168, 95).
; PLAN: r0=168(x), r1=95(y), r2=21(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 95
LDI r2, 21
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
