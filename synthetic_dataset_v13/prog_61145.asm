; DESCRIPTION: Places a white 120x102 rectangle at position (372, 154).
; PLAN: r0=372(x), r1=154(y), r2=120(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 154
LDI r2, 120
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
