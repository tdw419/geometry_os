; DESCRIPTION: Places a cyan 92x19 rectangle at position (222, 86).
; PLAN: r0=222(x), r1=86(y), r2=92(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 86
LDI r2, 92
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
