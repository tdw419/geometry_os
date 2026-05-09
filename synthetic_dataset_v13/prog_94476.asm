; DESCRIPTION: Places a cyan 109x100 rectangle at position (294, 54).
; PLAN: r0=294(x), r1=54(y), r2=109(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 54
LDI r2, 109
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
