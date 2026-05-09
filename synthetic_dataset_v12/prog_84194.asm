; DESCRIPTION: Places a white 36x86 rectangle at position (19, 29).
; PLAN: r0=19(x), r1=29(y), r2=36(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 29
LDI r2, 36
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
