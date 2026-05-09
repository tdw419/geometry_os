; DESCRIPTION: Composite: Draws a cyan line from (502, 66) to (173, 196) then Places a cyan 55x30 rectangle at position (271, 117).
; PLAN: r0=502(x1), r1=66(y1), r2=173(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=117(y), r7=55(width), r8=30(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 66
LDI r2, 173
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 117
LDI r7, 55
LDI r8, 30
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
