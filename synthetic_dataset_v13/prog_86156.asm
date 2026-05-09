; DESCRIPTION: Places a green 68x21 rectangle at position (228, 141).
; PLAN: r0=228(x), r1=141(y), r2=68(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 141
LDI r2, 68
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
