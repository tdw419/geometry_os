; DESCRIPTION: Places a cyan 24x40 rectangle at position (294, 54).
; PLAN: r0=294(x), r1=54(y), r2=24(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 54
LDI r2, 24
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
