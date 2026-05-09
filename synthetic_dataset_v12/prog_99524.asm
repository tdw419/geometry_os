; DESCRIPTION: Places a cyan 61x79 rectangle at position (168, 111).
; PLAN: r0=168(x), r1=111(y), r2=61(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 111
LDI r2, 61
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
