; DESCRIPTION: Places a cyan 27x74 rectangle at position (321, 65).
; PLAN: r0=321(x), r1=65(y), r2=27(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 65
LDI r2, 27
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
