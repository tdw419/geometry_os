; drawing loop program
; initialization
  LDI r13, 3057
  LDI r1, 0x718943
main_0:
  LDI r3, 0x94ED7C
  LDI r13, 1572
  LDI r2, 2857
  PSETI
  SHR r1, r0, r13
  SAR r13, r2, r0
  SHL r2, r0, r13
  SAR r3, r6, r9
  ADDI r6, r7, 41
  XOR r12, r1, r10
  OR r9, r8, r26
  AND r14, r3, r9
  CMPI r10, 0x87CB36
  FRAME
  JMP main_0
