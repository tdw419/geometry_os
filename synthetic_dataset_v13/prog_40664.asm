; DESCRIPTION: Places a yellow 47x72 rectangle at position (425, 27).
; PLAN: r0=425(x), r1=27(y), r2=47(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 27
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
