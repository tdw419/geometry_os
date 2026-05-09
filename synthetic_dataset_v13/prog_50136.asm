; DESCRIPTION: Places a cyan 39x12 rectangle at position (391, 172).
; PLAN: r0=391(x), r1=172(y), r2=39(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 172
LDI r2, 39
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
