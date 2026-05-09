; DESCRIPTION: Places a green 18x86 rectangle at position (380, 60).
; PLAN: r0=380(x), r1=60(y), r2=18(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 60
LDI r2, 18
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
