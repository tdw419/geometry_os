; DESCRIPTION: Places a green 96x28 rectangle at position (328, 34).
; PLAN: r0=328(x), r1=34(y), r2=96(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 34
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
