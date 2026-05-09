; DESCRIPTION: Places a cyan 44x86 rectangle at position (391, 28).
; PLAN: r0=391(x), r1=28(y), r2=44(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 28
LDI r2, 44
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
