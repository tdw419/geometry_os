; DESCRIPTION: Places a green 70x86 rectangle at position (141, 48).
; PLAN: r0=141(x), r1=48(y), r2=70(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 48
LDI r2, 70
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
