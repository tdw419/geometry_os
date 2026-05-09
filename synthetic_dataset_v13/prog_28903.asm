; DESCRIPTION: Places a yellow 38x29 rectangle at position (262, 213).
; PLAN: r0=262(x), r1=213(y), r2=38(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 213
LDI r2, 38
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
