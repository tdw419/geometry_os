; DESCRIPTION: Places a cyan 106x37 rectangle at position (27, 29).
; PLAN: r0=27(x), r1=29(y), r2=106(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 29
LDI r2, 106
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
