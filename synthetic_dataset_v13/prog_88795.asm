; DESCRIPTION: Places a white 72x61 rectangle at position (59, 154).
; PLAN: r0=59(x), r1=154(y), r2=72(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 154
LDI r2, 72
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
