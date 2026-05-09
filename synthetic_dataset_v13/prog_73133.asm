; DESCRIPTION: Places a yellow 21x66 rectangle at position (262, 29).
; PLAN: r0=262(x), r1=29(y), r2=21(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 29
LDI r2, 21
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
