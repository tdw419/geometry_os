; DESCRIPTION: Places a cyan 61x56 rectangle at position (346, 59).
; PLAN: r0=346(x), r1=59(y), r2=61(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 59
LDI r2, 61
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
