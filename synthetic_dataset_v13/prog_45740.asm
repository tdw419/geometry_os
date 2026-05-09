; DESCRIPTION: Places a green 68x76 rectangle at position (269, 21).
; PLAN: r0=269(x), r1=21(y), r2=68(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 21
LDI r2, 68
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
